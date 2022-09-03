from bs4 import BeautifulSoup
import requests

#Site 1 -> https://www.golfclubsatthetribute.com/Default.aspx?p=DynamicModule&pageid=149&ssid=204&vnf=1
#Site 2 -> https://www.thegolfclubatfossilcreek.com/club-contacts
#Site 3 -> https://www.mg-cc.org/club-information/club-contacts

#verifica o site com as informações
url = requests.get("https://www.thegolfclubatfossilcreek.com/club-contacts").content

#analisador do site
soup = BeautifulSoup(url, 'html.parser')

#seleciona as informações para consulta
email = soup.find('div', class_='col-xs-2' 'a', href = "btn btn-email")

print(email)