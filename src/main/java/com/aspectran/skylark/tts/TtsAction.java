package com.aspectran.skylark.tts;

import com.aspectran.core.activity.Translet;

import java.io.IOException;

public class TtsAction {

    public void textToSpeech(Translet translet) throws IOException {
        TextToSpeechBean ttsBean = translet.getBean("voice1");
        ttsBean.speak(translet);
    }

}