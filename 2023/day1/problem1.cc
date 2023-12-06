#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <map>
#include <set>
#include <queue>
#include <stack>
#include <cmath>

using namespace std;

int main() {
  unsigned long long int sum = 0;
  string s;
  while (cin >> s) {
    long n = s.length();
    unsigned long long partial = 0;
    for(int i=0; i<n; i++) {
      if(s[i] < '0' || s[i] > '9') continue;
      partial += 10 * (s[i] - '0');
      break;
    }

    unsigned long long right = 0;
    for(int i=n-1; i>=0; i--) {
      if(s[i] < '0' || s[i] > '9') continue;
      partial += s[i] - '0';
      break;
    }

    sum += partial;
  }
  cout << sum << endl;
  return 0;
}
