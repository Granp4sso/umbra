#include "fibonacci.h"

extern void umbra_enclave_run();

int main(){

    
    fibonacci();
    umbra_enclave_run();
    while(1);

    return 0;
}
