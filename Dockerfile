FROM ubuntu:14.04
MAINTAINER Christian Brenninkmeijer <Christian.Brenninkmeijer@manchester.ac.uk>

#Install via apt-get
RUN apt-get update && apt-get install -y \
   build-essential \
   curl \
   python \ 
   python2.7-dev \
   python-pip \
   python-numpy \
   python-matplotlib \
   wget 

#Install HtSeq
RUN curl https://pypi.python.org/packages/source/H/HTSeq/HTSeq-0.6.1.tar.gz#md5=b7f4f38a9f4278b9b7f948d1efbc1f05 > HTSeq-0.6.1.tar.gz && \
   tar -xzf HTSeq-0.6.1.tar.gz && \
   rm HTSeq-0.6.1.tar.gz && \
   cd HTSeq-0.6.1 && \
   ls && \ 
   python setup.py install --user

#RUN rm -r HTSeq-0.6.1

COPY brenninc_utils.py /brenninc_utils.py
COPY fastq_sorter.py /fastq_sorter.py


