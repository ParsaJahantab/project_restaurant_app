import java.io.*;
import java.net.*;
import java.util.*;
import java.util.stream.Stream;
public class Login {
    Login() {
    }

    Login(ServerSocket serverSocket) throws IOException {
        String[] vars = new String[2];
        int j = 0;
        while (true) {
            Socket socket = serverSocket.accept();
            DataOutputStream dataOutputStream = new DataOutputStream(socket.getOutputStream());
            DataInputStream dataInputStream = new DataInputStream(socket.getInputStream());
            byte[] str = new byte[64];
            dataInputStream.read(str);
            int i = 0;
            String string = new String();
            while (str[i] != 0) {
                string = string + ((char) str[i]);
                i = i + 1;
            }
            vars[j] = string;
            j = j + 1;
            if (j == 2) {
                if (!CheckNum(vars[0])) {
                    //dataOutputStream.writeUTF("correct");
                    File file1 = new File("C:\\Users\\asus\\Desktop\\ap\\project_restaurant\\Data\\" + vars[0]);
                    File file = new File("C:\\Users\\asus\\Desktop\\ap\\project_restaurant\\Data\\" + vars[0] + "\\" + vars[1] + ".txt");
                    FileReader fileReader=new FileReader(file);
                    BufferedReader bufferedReader=new BufferedReader(fileReader);
                    String number=bufferedReader.readLine();
                    String password=bufferedReader.readLine();
                }
            } else {
                dataOutputStream.writeUTF("wrong");
            }
        }
    }

    boolean CheckNum(String number) throws IOException {
        File file = new File("C:\\Users\\asus\\Desktop\\ap\\project_restaurant\\Data\\numbers.txt");
        FileReader fileReader = new FileReader(file);
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) {
                break;
            }
            System.out.println(line);
            if (line.equals(number)) {
                bufferedReader.close();
                fileReader.close();
                return true;
            }
        }
        bufferedReader.close();
        fileReader.close();
        return false;
    }
}

