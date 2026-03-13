import 'dart:io';

void main() {

    int n = 13;

    int maxi = 0;
    int nr_grupe = 0;

    List<int> fr = List.filled(50, 0);

    for (int i = 1; i <= n; i++) {

        int sum = 0;
        int x = i;

        while (x > 0) {
            sum += x % 10;
            x ~/= 10;
        }

        fr[sum]++;

        if (fr[sum] > maxi) {
            maxi = fr[sum];
            nr_grupe = 1;
        }
        else if (fr[sum] == maxi) {
            nr_grupe++;
        }
    }

    print(nr_grupe);
}