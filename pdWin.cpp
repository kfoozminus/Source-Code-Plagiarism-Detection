#include <bits/stdc++.h>
#include<dirent.h>
#include<unistd.h>
using namespace std;

#define ll long long
#define ull unsigned long long
#define pii pair <int, int>
#define vi vector <int>
#define vl vector <ll>
#define pll pair <ll, ll> 
#define PI acos(-1)
#define MP make_pair
#define PB push_back
#define F first
#define S second
#define MEM(a, b) memset(a, b, sizeof(a))
#define GCD(a,b) __gcd(a,b)
#define LCM(a,b) (a*(b/gcd(a,b)))
#define SQR(a) ((a)*(a))
#define INF 100000000
#define MOD 1000000007
#define EPS 1e-9
#define harmonic(n) 0.57721566490153286l+log(n)
#define nl puts("")
#define all(v) v.begin(), v.end()
#define vsort(v) sort(all(v))
#define uniq(v) v.resize( unique(all(v)) - v.begin())
//unique(all(v)) returns the end of the new vector in which no consecutive elements are same.
//resize(x) keeps the first x elements, resize(x, i) makes its size x - adds i's if new elements are needed, default 0
#define acum(v, init) accumulate(all(v), init)
//accumulate(all(v), init, [](int a, int b) {return a + b; })
#define ran(a, b) ((((rand() << 15) ^ rand()) % ((b) - (a) + 1)) + (a))
inline bool EQ(double a, double b) { return fabs(a - b) < EPS; }

//debug
#ifdef kfoozminus

template < typename F, typename S >
ostream& operator << ( ostream& os, const pair< F, S > & p ) {
	return os << "(" << p.first << ", " << p.second << ")";
}

template < typename T >
ostream &operator << ( ostream & os, const vector< T > &v ) {
	os << "{";
	for(auto it = v.begin(); it != v.end(); ++it) {
		if( it != v.begin() ) os << ", ";
		os << *it;
	}
    return os << "}";
}

template < typename T >
ostream &operator << ( ostream & os, const set< T > &v ) {
	os << "[";
	for(auto it = v.begin(); it != v.end(); ++it) {
		if( it != v.begin()) os << ", ";
		os << *it;
	}
    return os << "]";
}

template < typename F, typename S >
ostream &operator << ( ostream & os, const map< F, S > &v ) {
	os << "[";
	for(auto it = v.begin(); it != v.end(); ++it) {
		if( it != v.begin() ) os << ", ";
		os << it -> first << " = " << it -> second ;
	}
    return os << "]";
}

#define dbg(args...) do {cerr << #args << " : "; faltu(args); } while(0)

clock_t tStart = clock();
#define timeStamp dbg("Execution Time: ", (double)(clock() - tStart)/CLOCKS_PER_SEC)

void faltu () { cerr << endl; }

template <typename T>
void faltu( T a[], int n ) {
	for(int i = 0; i < n; ++i) cerr << a[i] << ' ';
	cerr << endl;
}

template <typename T, typename ... hello>
void faltu( T arg, const hello &... rest) { cerr << arg << ' '; faltu(rest...); }

#else
#define dbg(args...)
#endif
//debug

ll add(ll a, ll b, ll m = MOD) {
	ll ret = a + b;
	if(ret >= m) ret -= m;
	return ret;
}

ll subtract(ll a, ll b, ll m = MOD) {
	ll ret = a - b;
	if(ret < 0) ret += m;
	return ret;
}

ll mult(ll a, ll b, ll m = MOD) {
	ll ret = a * b;
	if(ret >= m) ret %= m;
	return ret;
}

ll bigmod(ll a, ll b, ll m = MOD) {
	ll ret = 1;
	while(b) {
		if(b & 1) ret = mult(ret, a, m);
		b >>= 1;
		a = mult(a, a, m);
	}
	return ret;
}

ll inverse(ll n, ll m = MOD) { return bigmod(n, m - 2); }

#define PMX 1000000

int marked[PMX/64 + 2];
vi primes;

#define mark(x) marked[x >> 6] |= (1 << ((x & 63) >> 1))
#define check(x) (marked[x >> 6] & (1 << ((x & 63) >> 1)))

bool isPrime(int x)
{
	return (x > 1) && ((x == 2) || ((x & 1) && (!(check(x)))));
}

void seive(int n)
{
	int i, j;
	for(i = 3; i * i <= n; i += 2) if(!check(i)) for(j = i * i; j <= n; j += i << 1) mark(j);
	primes.PB(2);
	for(i = 3; i <= n; i += 2) if(isPrime(i)) primes.PB(i);
}

//int fx[]={1, -1, 0, 0}; int fy[]={0, 0, 1, -1};
int fx[]={0, 0, 1, -1, -1, 1, -1, 1}; int fy[]={-1, 1, 0, 0, 1, 1, -1, -1};

bool checkBit(int n, int i) { return (n&(1<<i)); }
int setBit(int n, int i) { return (n|(1<<i)); }
int resetBit(int n, int i) { return (n&(~(1<<i))); }

#define MX 5007
#define MXFILE 100007
#define B 41

vector< pair<int, int> > tokens[MXFILE];	//tokens[i] contains {token, line} for file i
vector<string> tokenFileName;	//contains i-th file name, used for output
vector< pair<ll, int> > fingerPrint[MXFILE];	//{hash, position in kGramHashValues} for file i
map< pair<ll, int>, int> mapp;	//{hash, fileno} to {count of matches with this value in this file
int cntMatch[MXFILE];	//used for determining every file's max match, cleared every time, contains count of match with file i
vector< pair<int, int> > tokenTrack, lineTrack;	//for every file i, segments of token ranges and line ranges, used to count total token and line matched
bool plagirised[MXFILE], checked[MXFILE];

struct kGramHash {
	int hash, startLine, endLine;	//hashValue, start and end line in original source file
	kGramHash(int _hash, int _startLine, int _endLine) : hash(_hash), startLine(_startLine), endLine(_endLine) {}
};

vector< kGramHash > kGramValues[MXFILE];	//k-gram values for every file i

int main (int argc, char* argv[]) {

	string search_directory;
	search_directory = string(argv[1]);		//directory for a specific task of a specific contest
	int K = stoi( string(argv[2]) );
	int W = stoi( string(argv[3]) );
	//dbg(search_directory);
	//dbg(K, W);

	char s[100];
	freopen((search_directory + string("/filenames")).c_str(), "r", stdin);
	while(scanf("%s", s) != EOF) {
		tokenFileName.PB(string(s));
	}
	fclose(stdin);

	//dbg(tokenFileName);

	int totalTokens = tokenFileName.size();
	for(int i = 0; i < totalTokens; i ++) {

		freopen((search_directory + string("/tokens/") + tokenFileName[i]).c_str(), "r", stdin);
		int x, line;
		tokens[i].PB( {0, 0} );
		while(scanf("%d %d", &x, &line) == 2) {
			tokens[i].PB( {x, line} );
		}
		//dbg(i, tokens[i]);
		fclose(stdin);
	}

	//dbg(555);

	//B^(k - 1)
	ll bK = 1;
	for(int i = 1; i < K; i ++) bK = mult(bK, B);

	for(int i = 0, j, nex, sz; i < totalTokens; i ++) {

		//calculate k-gram hash for file i
		ll hash = 0;	//tokens[i][0] has dummy value
		//for first k-gram
		for(j = 1, sz = tokens[i].size(); j < min(sz, K + 1); j ++) {
			hash = (hash * B + tokens[i][j].F) % MOD;
		}

		//nex containts next tokens line
		if(j < sz) nex = tokens[i][j].S - 1;
		else nex = 0;

		kGramValues[i].PB( kGramHash(hash, tokens[i][1].S, max(tokens[i][j - 1].S, nex)) );

		for( ; j < tokens[i].size(); j ++) {

			//hash = (hash - (last token outside k-gram) * B^(K - 1)) * B + this token
			hash = (mult(subtract(hash, mult(tokens[i][j - K].F, bK)), B) + tokens[i][j].F) % MOD;

			if(j + 1 < sz) nex = tokens[i][j + 1].S - 1;
			else nex = 0;

			//startLine would be min of this tokens line or previous tokens line + 1 --- to take into account whitespaces
			//endLine would be max of this token's line or next tokens line - 1 --- to take into account whitespaces
			kGramValues[i].PB( kGramHash(hash, min(tokens[i][j - K].S + 1, tokens[i][j - K + 1].S), max(tokens[i][j].S, nex)) );
		}

		//calculate fingerprint positions for each token
		int minPos = 0, totalKGram = kGramValues[i].size();
		//first W length window - calculate min hash, minPos contains the position in kGramValues
		for(j = 0; j < min(W, totalKGram); j ++) if(kGramValues[i][minPos].hash >= kGramValues[i][j].hash) minPos = j;
		fingerPrint[i].PB( {kGramValues[i][minPos].hash, minPos} );

		for( ; j < totalKGram; j ++) {
			if(minPos == j - W) {	//if minPos is outside the window
				minPos = j - W + 1;
				for(int k = j - W + 1; k <= j; k ++) {		//calculate this window's minHash from scratch
					if(kGramValues[i][minPos].hash >= kGramValues[i][k].hash) minPos = k;
				}
			}
			else {
				if(kGramValues[i][minPos].hash >= kGramValues[i][j].hash) minPos = j;
			}
			fingerPrint[i].PB( {kGramValues[i][minPos].hash, minPos} );
		}
		//sort the fp list
		sort(fingerPrint[i].begin(), fingerPrint[i].end());
		
		int totalFP = fingerPrint[i].size();
		int start = 0;
		for(j = 1; j < totalFP; j ++) {
			if(fingerPrint[i][j].F != fingerPrint[i][j - 1].F) {	//j - 1'th fingerprint is new
				mapp[ {fingerPrint[i][j - 1].F, i} ] = j - start;
				start = j;
			}
		}
		mapp[ {fingerPrint[i][j - 1].F, i} ] = j - start;
	}

	for(int i = 0, j; i < totalTokens; i ++) {		//for every file i

		//set count matches with other files to 0
		for(j = 0; j < totalTokens; j ++) cntMatch[j] = 0;

		int totalFP = fingerPrint[i].size();
		for(j = 1; j < totalFP; j ++) {

			if(fingerPrint[i][j].F != fingerPrint[i][j - 1].F) {	//for every unique hash value

				ll hashVal = fingerPrint[i][j - 1].F;
				for(int k = 0; k < totalTokens; k ++) {		//check if other files have this hash as fingerprint

					if(k == i) continue;	//don't want to match with itself
					if(plagirised[k]) continue;
					cntMatch[k] += min(mapp[ {hashVal, i} ], mapp[ {hashVal, k} ]);		//how many k-grams matched?
				}
			}
		}
		ll hashVal = fingerPrint[i][j - 1].F;
		for(int k = 0; k < totalTokens; k ++) {

			if(k == i) continue;
			if(plagirised[k]) continue;
			cntMatch[k] += min(mapp[ {hashVal, i} ], mapp[ {hashVal, k} ]);
		}

		//take the file which matches maximum, save in maxMatch
		int maxCntMatch = 0, maxMatch = i;
		for(j = 0; j < totalTokens; j ++) if(maxCntMatch < cntMatch[j]) maxCntMatch = cntMatch[j], maxMatch = j;

		//go through every fingerprint of document i, calculate amount of matching with maxMatch
		totalFP = fingerPrint[i].size();
		int start = 0;
		for(j = 1; j < totalFP; j ++) {

			if(fingerPrint[i][j].F != fingerPrint[i][j - 1].F) {	//for every unique hash value

				hashVal = fingerPrint[i][j - 1].F;
				int cnt = min(mapp[ {hashVal, i} ], mapp[ {hashVal, maxMatch} ]);

				for(int k = 0; k < cnt; k ++) {
					int index = fingerPrint[i][start + k].S;	//index is the position in kGramValues of this matched fingerprint
					lineTrack.PB( {kGramValues[i][index].startLine, 0} );	//save this fingerprints line range
					lineTrack.PB( {kGramValues[i][index].endLine, 1} );
					tokenTrack.PB( {index, 0} );
					tokenTrack.PB( {index + K - 1, 1} );	//one fingerprint/hash = K tokens
				}
				start = j;
			}
		}
		hashVal = fingerPrint[i][j - 1].F;
		int cnt = min(mapp[ {hashVal, i} ], mapp[ {hashVal, maxMatch} ]);

		for(int k = 0; k < cnt; k ++) {
			int index = fingerPrint[i][start + k].S;
			lineTrack.PB( {kGramValues[i][index].startLine, 0} );
			lineTrack.PB( {kGramValues[i][index].endLine, 1} );
			tokenTrack.PB( {index, 0} );
			tokenTrack.PB( {index + K - 1, 1} );
		}

		int lineMatch = 0, tokenMatch = 0;
		int totalLine = tokens[i][ tokens[i].size() - 1].S, totalTokenInFile = tokens[i].size() - 1;
		if(lineTrack.size()) {

			vsort(lineTrack);
			vsort(tokenTrack);

			cnt = 0;		//no of ranges that is active right now
			for(j = 0; j < lineTrack.size(); j ++) {

				if(lineTrack[j].S) {	//if this is a range's end point
					-- cnt;
					if(cnt == 0) {
						lineMatch += lineTrack[j].F - start + 1;
					}
				}
				else {
					if(cnt == 0) start = lineTrack[j].F;
					cnt ++;
				}
			}

			cnt = 0;
			for(j = 0; j < tokenTrack.size(); j ++) {

				if(tokenTrack[j].S) {
					-- cnt;
					if(cnt == 0) {
						tokenMatch += tokenTrack[j].F - start + 1;
					}
				}
				else {
					if(cnt == 0) start = tokenTrack[j].F;
					cnt ++;
				}
			}
		}
		//clear last file's information
		lineTrack.clear();
		tokenTrack.clear();

		double perMatch = ((double) tokenMatch/totalTokenInFile) * 100.0;
		if(perMatch >= 90.0 && checked[ maxMatch ]) plagirised[i] = true;
		printf("%35s %35s %10.3lf percent %10d line\n", tokenFileName[i].c_str(), tokenFileName[ maxMatch ].c_str(), perMatch, lineMatch);

		checked[i] = true;
	}

	return 0;
}

