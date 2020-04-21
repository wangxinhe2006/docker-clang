FROM alpine

RUN apk add git; \
    git clone https://github.com/llvm/llvm-project.git; \
    apk del git; \
    cd llvm-project; \
    mkdir build; \
    cd build; \
    apk add cmake make gcc g++ python; \
    cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm; \
    make; \
    # make check-clang; \
    apk del cmake make gcc g++ python; \
    cd ../..; \
    rm -rf llvm-project
