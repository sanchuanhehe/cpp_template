FROM mcr.microsoft.com/devcontainers/cpp:1-debian-11

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Install required and recommended packages for ns-3
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    # Required packages
    g++ python3 cmake ninja-build git \
    # Recommended packages
    ccache gdb valgrind clang-format clang-tidy \
    # Optional packages
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 从 LLVM 官方下载最新的 clangd
RUN CLANGD_VERSION=18.1.3 && \
    wget https://github.com/clangd/clangd/releases/download/$CLANGD_VERSION/clangd-linux-$CLANGD_VERSION.zip && \
    unzip clangd-linux-$CLANGD_VERSION.zip && \
    cp -r clangd_$CLANGD_VERSION/bin/* /usr/local/bin/ && \
    cp -r clangd_$CLANGD_VERSION/lib/* /usr/local/lib/ && \
    rm -rf clangd-linux-$CLANGD_VERSION.zip clangd_$CLANGD_VERSION
