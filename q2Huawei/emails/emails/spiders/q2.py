# entrar no terminal
# instalar os imports com pip install xxx (Ex: pip install requests)
import re
import requests
from urllib.parse import urlsplit
from collections import deque
from bs4 import BeautifulSoup
import pandas as pd

# Site1 = https://www.golfclubsatthetribute.com/Default.aspx?p=DynamicModule&pageid=149&ssid=204&vnf=1
# Site2 = https://www.thegolfclubatfossilcreek.com/club-contacts#
# Site3 = https://www.mg-cc.org/web/pages/contact-us

# for some reason I tried to run the
# three URLs but only the "Site2" runs properly
# so I putted the working URL commented
scraping_url = input("Enter the website url: ") #https://www.thegolfclubatfossilcreek.com/club-contacts#

# save urls to be scraped
unscraped = deque([scraping_url])

# save scraped urls
scraped = set()

# save fetched emails
emails = set()

# verify and checks the scraped and unscraped URLs.
while len(unscraped):
    url = unscraped.popleft()
    scraped.add(url)

    # extract data from different parts of the URL
    # urlsplit returns 5-tuple
    # (addressing scheme, network location, path, query, fragment, identifier)
    parts = urlsplit(url)

    base_url = "{0.scheme}://{0.netloc}".format(parts)
    if '/' in parts.path:
        path = url[:url.rfind('/') + 1]
    else:
        path = url

    print("Crawling URL %s" % url)

    # request to the website
    try:
        response = requests.get(url)
    except (requests.exceptions.MissingSchema, requests.exceptions.ConnectionError):
        continue

    # extracting email addresses
    new_emails = set(re.findall(r"[a-z0-9\.\-+_]+@[a-z0-9\.\-+_]+\.com", response.text, re.I))
    emails.update(new_emails)

    # find all linked URLs to the website
    soup = BeautifulSoup(response.text, 'lxml')

    # filter with "a" and "href" often used as hyperlink in HTML
    for anchor in soup.find_all("a"):
        if "href" in anchor.attrs:
            link = anchor.attrs["href"]
        else:
            link = ''

            if link.startswith('/'):
                link = base_url + link

            elif not link.startswith('http'):
                link = path + link

# Saving the emails in CSV for better visualization
# You can find it in the Folder "spiders"
df = pd.DataFrame(emails, columns=["Email"]) # replace with column name you prefer
df.to_csv('email.csv', index=False)