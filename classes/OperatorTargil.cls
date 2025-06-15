public class OperatorTargil {
    
//-----------------------Questions-------------------------------------
    //----Q1----
    public static Integer AddNumbers(Integer num, Integer num2){
        return num + num2;
    }
    
    //----Q2----
    public static Boolean IsEven(Integer num){
        return num/2*2 == num;
    }
    
    //----Q3----
     public static Double CalculateRectangleArea(Double orech, Double rochav){
        return orech*rochav;
    }
    
    //Q4
    public static String FindLongerString(List<String> listString){
        String LongString = '';
        for(Integer i = 0; i < listString.size(); i++){
            if(listString[i].length() > LongString.length()){
                LongString = listString[i];
            }
        }
        return LongString;
    }
    
    //Q5
    
    public static String ReverseString(String str){
        String NewString = '';
        for(integer i = str.length()-1; i >= 0; i--){
            NewString += str.substring(i, i + 1);
        }
        return NewString;
    }
    
    //Q6
    public static List<Integer> ListZugi(List<Integer> Numbers){
        List<integer> listZugi = new List<integer>();
        for(integer i = 0; i < Numbers.size(); i++){
            if(Numbers[i]/2*2 == Numbers[i]){
                listZugi.add(Numbers[i]);
            }
        }
        return listZugi;
    }
    
    //Q7
    public static String GreetUser(String name){
        return 'Hello' + name;
    }

    public static void main(String[] args) {
        
//-----------------------Answers-------------------------------------
     //----A1----
        Integer num = 20, num2 = 10, num3 = 45;
        system.debug(num + '+' + num2 + ' = ' + AddNumbers(num, num2));
        // 10+20 = 30;
        
     //----A2----
        system.debug(num + ' IsEven ? ' + IsEven(num));
        // 20 IsEven ? true;
        
        system.debug(num3 + ' IsEven ? ' + IsEven(num3));
        // 45 IsEven ? false;
        
     //----A3----
        Double mis = 25.5, mis2 = 30.5;
        system.debug('orech-> ' + mis + ' | rochav-> ' + mis2 + ' | Area-> ' + CalculateRectangleArea(mis, mis2) + ' |');
        //orech-> 25.5 | rochav-> 30.5 | Area-> 777.75 |
     
     //A4
        List<String> listString = new List<String>{'Hodaya', 'Avishag', 'Efrat'};
        system.debug('the long string in list is-> ' + FindLongerString(listString) + '.');
        //the long string in list is-> Avishag.
    
    //A5
        String str = 'Revital';
        system.debug('the first str is-> ' + str + ' | the last str is-> ' + ReverseString(str) + '.');
        //the first str is-> Revital | the last str is-> lativeR.
        
    //A6
        List<Integer> Numbers = new List<Integer>{1, 2, 3, 4, 5, 6};
        system.debug('the first list is-> ' + Numbers + ' | the last list is-> ' + ListZugi(Numbers) + '.');
        //the first list is-> 1, 2, 3, 4, 5, 6 | the last list is-> 2, 4, 6.
    
    //A7
        List<String> names = new List<String>{'Hodaya', 'Avishag', 'Efrat'};
            for(Integer i = 0; i < names.size(); i++){
                system.debug('names: ');
                system.debug(GreetUser(names[i] + ', '));
            }
        //names: Hello Hodaya, Hello Avishag, Hello Efrat, 
    }

}