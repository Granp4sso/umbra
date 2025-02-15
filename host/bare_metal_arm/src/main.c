#include "fibonacci.h"

extern void umbra_enclave_run();

int main(){

    /*int x = 128;
    
    for(int j = 0; j < 10; j++) x++;

    fibonacci();*/
    umbra_enclave_run();
    while(1);

    return 0;
}
