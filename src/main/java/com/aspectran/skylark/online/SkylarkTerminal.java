package com.aspectran.skylark.online;

import com.aspectran.core.activity.Translet;
import com.aspectran.skylark.tts.TextToSpeechBean;

import java.io.IOException;

public class SkylarkTerminal {

    public void textToSpeech(Translet translet) throws IOException {
        TextToSpeechBean ttsBean = translet.getBean("voice1");
        ttsBean.speak(translet);
    }

}