package hostel.main;


public class NumberToWords {
    private static final String[] units = {
        "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
        "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen",
        "Sixteen", "Seventeen", "Eighteen", "Nineteen"
    };

    private static final String[] tens = {
        "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
    };

    public static String convert(int number) {
        if (number == 0) return "Zero";

        return convertWords(number).trim();
    }

    private static String convertWords(int number) {
        String words = "";

        if (number >= 100000) {
            words += convertWords(number / 100000) + " Lakh ";
            number %= 100000;
        }

        if (number >= 1000) {
            words += convertWords(number / 1000) + " Thousand ";
            number %= 1000;
        }

        if (number >= 100) {
            words += convertWords(number / 100) + " Hundred ";
            number %= 100;
        }

        if (number > 0) {
            if (number < 20) {
                words += units[number];
            } else {
                words += tens[number / 10];
                if (number % 10 != 0) {
                    words += " " + units[number % 10];
                }
            }
        }

        return words;
    }
}

