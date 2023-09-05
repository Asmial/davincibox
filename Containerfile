FROM registry.fedoraproject.org/fedora:latest AS davincibox

# Support Nvidia Container Runtime (https://developer.nvidia.com/nvidia-container-runtime)
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox commands" \
      summary="Dependencies for running DaVinci Resolve on image-based Linux operating systems" \
      maintainer="pcsikos@zelikos.dev"

COPY extra-packages /
RUN dnf -y update && \
    grep -v '^#' /extra-packages | xargs dnf -y install
RUN rm /extra-packages
