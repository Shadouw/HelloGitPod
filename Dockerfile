FROM gitpod/workspace-full:latest

# Inspiration: https://www.gitpod.io/blog/docker-in-gitpod/
# Install clang-tidy
USER root
#RUN apt-get update && apt-get install -y \
#		clang-tidy \
#	&& apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

### C/C++ ###
RUN curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && apt-add-repository -yu "deb http://apt.llvm.org/cosmic/ llvm-toolchain-cosmic-9.0 main" \
    && apt-get install -yq \
        clang-format-9.0 \
        clang-tools-9.0 \
        cmake \
    && ln -s /usr/bin/clangd-9.0 /usr/bin/clangd \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*