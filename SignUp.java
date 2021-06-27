import java.io.*;
import java.net.*;
import java.util.*;
import java.util.stream.Stream;

public class SignUp {
    SignUp(){}
    SignUp(ServerSocket serverSocket) throws IOException {
        String[] vars=new String[5];
        int j=0;
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
            vars[j]=string;
            j=j+1;
            if (j==5) {
                if (!CheckNum(vars[0])) {
                    //dataOutputStream.writeUTF("correct");
                    FileWriter fileWriter2 = new FileWriter("C:\\Users\\asus\\Desktop\\ap\\project_restaurant\\Data\\numbers.txt", true);
                    fileWriter2.write(vars[0]+'\n');
                    File file1 = new File("C:\\Users\\asus\\Desktop\\ap\\project_restaurant\\Data\\" + vars[0]);
                    file1.mkdir();
                    File file = new File("C:\\Users\\asus\\Desktop\\ap\\project_restaurant\\Data\\" + vars[0]+"\\"+vars[1]+".txt");
                    FileWriter fileWriter = new FileWriter(file,true);
                    System.out.println(vars[0] + '\n' + vars[1] + '\n' + vars[2] + '\n' + vars[3] + '\n' + vars[4]);
                    fileWriter.write(vars[0] + '\n' + vars[1] + '\n' + vars[2] + '\n' + vars[3] + '\n' + vars[4]);
                    fileWriter.close();
                    fileWriter2.close();
                }
            }
            else
            {
                dataOutputStream.writeUTF("wrong");
            }
        }
    }
    boolean CheckNum(String number) throws IOException {
        File file=new File("C:\\Users\\asus\\Desktop\\ap\\project_restaurant\\Data\\numbers.txt");
        FileReader fileReader=new FileReader(file);
        BufferedReader bufferedReader=new BufferedReader(fileReader);
        while (true)
        {
            String line=bufferedReader.readLine();
            if (line==null)
            {
                break;
            }
            System.out.println(line);
            if (line.equals(number))
            {
                bufferedReader.close();
                fileReader.close();
                return true;
            }
        }
        bufferedReader.close();
        fileReader.close();
        return false;
    }

    public static void main(String[] args) throws IOException {
        SignUp signUp=new SignUp();
        System.out.println(signUp.CheckNum("123242"));
    }
}
