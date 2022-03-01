FROM amazonlinux
COPY lab1_snd1.sh .
RUN chmod ugo+x lab1_snd1.sh
RUN mkdir /home/snd
CMD ./lab1_snd1.sh
