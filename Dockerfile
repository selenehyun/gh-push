FROM alpine:latest

LABEL repository="http://github.com/selenehyun/gh-push"
LABEL homepage="http://github.com/selenehyun/gh-push"
LABEL "com.github.actions.name"="Push"
LABEL "com.github.actions.description"="The desired files can be Repository Commit to Push."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

RUN apk --no-cache add bash git

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
