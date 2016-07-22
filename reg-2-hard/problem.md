<!-- RATING: HARD -->
<!-- NAME:  BOOT CAMP 2 -->
<!-- GENERATOR: generate.pl -->
# BOOT CAMP 2

Many of the AI agents we've detected in the wild don't rely on simple bit streams for their C2 channels. Rather, they've got sophisticated visual processing components that can read images and determine what instructions the AI central control is sending out. We've seen Gray codes used for this type of application quite often, and a lot of the times we've seen these instructions embedded into other media. We've seen them embedded in TV commercials, even just a single frame. The agents can spot them, and they know what to do.  

Anyway, let's get to it. Time to see if you're as good as some of the AI agents... 

## INPUT
You'll get a bunch of text. This is a Base64-encoded PNG image file. Your job is to process the image file and determine what was encoded. 

## OUTPUT
We'll keep this simple. The image encodes 4 characters
## SAMPLE INPUT
iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAACVBMVEX///8AAAD/AADAyZ2wAAAF
OklEQVRogb2aS5LlJhBFRYSZlwe5HyrCnvMiYJO9Sj8EJPlFaGINuutJHOW9yUcIdF3G8RPrfeRg
XTWPikc6JGAh5W2MdryMcRgnVHGkl7JOpEWN5NdErf9sjYCF1J+3QfZZs4PsECfIzo0TpG4S7RJu
fbq6fGW+Lk+Zal30sKtmo8vL846oxUrAVpfdOLe6bGV7wlL2oMtS9qDLUgbvkSdCt7NHK9rMoxWt
7NFKVU3zgBDIgRVp5sBK/XAzcIAkruxE1wXpJVKuSJET9/kK1P+J+28I6h8OkCb/HdIiwDv3zQfx
f+K+lSb+T5CLI8ctf6UMThF4g1SBjLM7srcvTNlwXzaWSszMP86+fCSH20woHEnbBx9PGUyDvpnp
fPrH066ZMgtP/3jaNZNn4YEEPO2aSTNZI2UE8cxgsgaCCdtPeypJWcQ7eWbyShZFCk2etjKdF1It
.
.
. (omitted for brevity)
.
.
W0T+mvOBIhA1mVjjWB1+OTIWEMSqzfCZ+f94fuVBIICjCidwAT8oBP+Qm4+4GyGRf2eQKLc4gxpu
5oo+GTXFgfXEEVjnk0RgbuHTydUPYJCod3hR2XqFudpTAs8am+IYGDckAm1W1rcHqMwY6E1dVJkx
OJq6vuV+SMiboPczdPW+Rwqx25q6WgOgd+KI94UL79u8o9sEj843Wm1dpGkqhG8H0wPIdx8Uif5n
J5Hkme6AgqeLd2+2A+rqYlVDkE0Q2qEIEr1KmZc18vAN1XIT1Ajjh0kcCXtZt4zKkYPPwdrCcELk
9+hDNSDLyOHwO7U+VISxcHVCsOH/KAZnrKv/ATq1UQLsrCdnAAAAAElFTkSuQmCC

## SAMPLE OUTPUT
IYIQ
