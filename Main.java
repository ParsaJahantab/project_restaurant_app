import java.io.IOException;
import java.net.*;
import java.util.*;
import java.io.*;
import java.util.Arrays.*;
public class Main {

    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket=new ServerSocket(6000);
        while (true) {
            Socket socket=serverSocket.accept();
            DataOutputStream dataOutputStream=new DataOutputStream(socket.getOutputStream());
            DataInputStream dataInputStream=new DataInputStream(socket.getInputStream());
            byte[] str = new byte[64];
            dataInputStream.read(str);
            int i = 0;
            System.out.println(str[0]);
            String string=new String();
            while (str[i] != 0) {
                string=string+((char)str[i]);
                i = i + 1;
            }
            if (string.equals("signup"))
            {
                SignUp signUp=new SignUp(serverSocket);
            }
            else if (string.equals("login"))
            {

            }
        }

        //byte[] bytes=dataInputStream;
    }
}
