package com.aspectran.skylark.tts;

import com.aspectran.core.activity.Translet;

import java.io.IOException;

public class TtsApiV0 implements TtsApi {

    @Override
    public void tts(Translet translet) throws IOException {
        TextToSpeechBean ttsBean = translet.getBean("voice-kevin16");
        ttsBean.speak(translet);
    }

    @Override
    public void download(Translet translet) throws IOException {
        TextToSpeechBean ttsBean = translet.getBean("voice-kevin16");
        ttsBean.download(translet);
    }

}