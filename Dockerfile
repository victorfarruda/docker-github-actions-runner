FROM python:3.8
LABEL maintainer="victor"

ARG GH_RUNNER_VERSION="2.169.1"
ARG TARGETPLATFORM

RUN mkdir /home/vedois
RUN chmod 777 /home/vedois

RUN pip install pipenv

WORKDIR /actions-runner
COPY install_actions.sh /actions-runner

RUN chmod +x /actions-runner/install_actions.sh
RUN ./install_actions.sh ${GH_RUNNER_VERSION} ${TARGETPLATFORM}

COPY config_actions.sh /actions-runner
RUN chmod +x /actions-runner/config_actions.sh

RUN chmod 777 .

RUN groupadd -r vedois && useradd -p vedois --no-log-init -r -g vedois vedois
USER vedois
RUN ./config_actions.sh

ENTRYPOINT ["/actions-runner/run.sh"]

