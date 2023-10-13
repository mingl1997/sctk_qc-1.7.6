FROM rocker/shiny-verse:4.3.1

MAINTAINER Joshua Campbell <camp@bu.edu>

COPY . /sctk
RUN apt-get -y update -qq \
  && apt-get install -y --no-install-recommends \
  libjpeg-dev libv8-dev libbz2-dev liblzma-dev libglpk-dev libgeos-dev \
  libpq-dev \
  build-essential \
  libcurl4-openssl-dev \
  libxml2-dev \
  libssl-dev \
  libssh2-1-dev \
  libmagick++-dev \
  libcairo2-dev \
  pandoc \
  python3-pip
RUN addgroup --system app \
    && adduser --system --ingroup app app
RUN apt-get install -y python3-dev
RUN export CFLAGS="-O3 -march=nehalem" && pip3 install --upgrade pip && pip3 install numpy llvmlite scrublet virtualenv scanpy anndata bbknn pandas scanorama scipy astroid six

RUN R -e "options(timeout=360000)" \
  && R -e "devtools::install_deps('/sctk', dependencies = TRUE)"
RUN R -e "options(timeout=360000)" \
  && R -e "devtools::install_github('mingl1997/sctk_qc-1.7.6', ref = 'devel', dependencies = TRUE, repos = BiocManager::repositories())"
RUN R -e "options(timeout=360000)" \
  && R -e "devtools::build('/sctk')"

EXPOSE 80

CMD ["R", "-e", "shiny::runApp('/sctk/inst/shiny', port = 80, host = '0.0.0.0')"]