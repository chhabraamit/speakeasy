### Speak Easy

SpeakEasy is a product which will use audio as the first class reason. Currently, its representation is that whatever you speak, you get that as transcribed. So, its just a, in the current form, wrapper on Whisper from OpenAI. And it runs as a command line tool. But it requires that you have SOX and FFMPG installed.


### Usage

The convenient way to use it would be that you make it as an executable and use then from your terminal at anywhere. In iTerm, you can have a hotkey assigned either directly to the script or just to the terminal and then you can run it. 


- `brew install sox`

- `brew install ffmpg` 

- `chmod +x tts.sh`

- `cp tts.sh tts`

- `sudo ln -s /Users/chhabra/temple/artifacts/garage/tts /usr/local/bin/tts`

- ensure that `/usr/local/bin/` is in the $PATH

