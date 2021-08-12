package PadraoSinalizacao;

public class Gerador {
    static String getRandomString(int i) 
    { 
        String theAlphaNumericS;
        StringBuilder builder;
        
        theAlphaNumericS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz"; 

        //create the StringBuffer
        builder = new StringBuilder(i); 

        for (int m = 0; m < i; m++) { 

            // generate numeric
            int myindex 
                = (int)(theAlphaNumericS.length() 
                        * Math.random()); 

            // add the characters
            builder.append(theAlphaNumericS 
                        .charAt(myindex)); 
        } 

        return builder.toString(); 
    } 

    public static void main(String[] args) 
    { 
        // the random string length
        int i = 10; 

        // output 
        System.out.println("Texto aleatório contendo as 10 letras: " +  getRandomString(i)); 
    }
} 
