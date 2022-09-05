# debian-slim container with sipsak installed


### example cli usage


```
### basic
docker run -it stackgurus/sipsak:latest sipsak -vvv -s sip:ansible@YOURSIPSERVERIP
```

```
# automatically populate eth0 interface IP address(assumes command is run on same host as SIP server and eth0 is the internal nic).
<p></p>
docker run -it stackgurus/sipsak:latest sipsak -vvv -s sip:ansible@`/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1`
```


* example helm chart healthcheck(testing may not work without edits)


```
apiVersion: v1
kind: Pod
metadata:
  name: "{{ include "telecom-voice.fullname" . }}-test-connection"
  labels:
    {{- include "telecom-voice.labels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": test
spec:
  containers:
    - name: sipsak
      image: stackgurus/sipsak
      command: ['sipsak']
      args: ['-vvv -s sip:ansible@{{ include "telecom-voice.fullname" . }}']
  restartPolicy: Never
```
