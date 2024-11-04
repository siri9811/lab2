#include "arithmetics.h"

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int multiply(int a, int b) {
    return a * b;
}

float divide(int a, int b) {
    if (b == 0) {
        return 0.0; // 분모가 0일 때 0 반환
    }
    return (float)a / b;
}

