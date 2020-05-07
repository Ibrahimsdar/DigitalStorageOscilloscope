#include <iostream>
#include <fstream>
#include <cmath>
#include <iomanip>
#define NUM_SAMPLES 100
//#define M_PI 3.14159265
using namespace std;

int main(){
	ofstream outFile;
	// if file testData.txt already exists, delete it and create new one
	outFile.open("testData.txt", ios::trunc);
	if(!outFile.is_open()){
		cout << "error opening outfile" << endl;
		return 1;
	}
	float timeBase = 0.000001;
	float trigger1_level = 0.5;
	float trigger2_level = 1.2;
	outFile << timeBase << " " << trigger1_level << " " << trigger2_level << "\n";
	// generate data for one wavelength of "sampling" - based on NUM_SAMPLES
	for (double i = 0; i < 2*M_PI; i += (2*M_PI)/NUM_SAMPLES){
              float tmp = 3*sin(i);
	      if (abs(tmp) < 0.001){
	      	tmp = 0;
	      }
	      float tmp2 = 3*cos(i);
	      if (abs(tmp2) < 0.001){
	      	tmp2 = 0;
	      }
	      outFile << setprecision(5) << tmp << " " << tmp2 << "\n";
	}
	outFile.close();
	return 0;
}
