package com.aspectran.skylark.tts;

import com.aspectran.core.activity.Translet;

import java.io.IOException;

public interface TtsApi {

    void tts(Translet translet) throws IOException;

}
