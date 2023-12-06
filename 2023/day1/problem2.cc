#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <map>
#include <set>
#include <queue>
#include <stack>
#include <cmath>
#include <regex>

using namespace std;

int main() {
  vector<pair<std::regex, string> > r;
  r.push_back(make_pair(std::regex("seven"), "seve7n"));
  r.push_back(make_pair(std::regex("eight"), "eigh8t"));
  r.push_back(make_pair(std::regex("two"), "tw2o"));
  r.push_back(make_pair(std::regex("one"), "on1e"));
  r.push_back(make_pair(std::regex("nine"), "nin9e"));
  r.push_back(make_pair(std::regex("three"), "thre3e"));
  r.push_back(make_pair(std::regex("four"), "fou4r"));
  r.push_back(make_pair(std::regex("five"), "fiv5e"));
  r.push_back(make_pair(std::regex("six"), "si6x"));

  unsigned long long int sum = 0;
  string s;
  while (cin >> s) {
    for(int i=0; i<r.size(); i++) {
      s = std::regex_replace(s, r[i].first, r[i].second);
    }

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

