FROM  fedora:21

MAINTAINER fabric8.io <fabric8@googlegroups.com>

RUN yum install -y npm git make
RUN npm install -g yo generator-hubot
RUN npm install -g coffee-script
RUN npm install hubot -g

RUN useradd hubot
USER hubot
WORKDIR /home/hubot

RUN yo hubot --owner="HSBNE (executive@hsbne.org)" --name="HSBNEBot" --description="HSBNE Chatbot" --adapter=irc --defaults
RUN npm install hubot-diagnostics hubot-pugme hubot-rules hubot-shipit hubot-youtube hubot-url-title hubot-help hubot-tell hubot-seen hubot-podbaydoors --save
ADD external-scripts.json /home/hubot/

ENV HUBOT_IRC_SERVER irc.freenode.net  
ENV HUBOT_IRC_ROOMS #hsbne  
ENV HUBOT_IRC_NICK HSBNEBot 

CMD /home/hubot/bin/hubot --adapter irc


