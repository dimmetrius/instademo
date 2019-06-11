package com.example.instademo;

import com.instabug.bug.BugReporting;
import com.instabug.crash.CrashReporting;
import com.instabug.library.Feature;
import com.instabug.library.Instabug;
import com.instabug.library.invocation.InstabugInvocationEvent;
import com.instabug.library.ui.onboarding.WelcomeMessage;

import io.flutter.app.FlutterApplication;

public class CustomFlutterApplication extends FlutterApplication {
    private static final String token = "310af2bc7e6a9e4e0662236e1f2180ba";
    @Override
    public void onCreate() {
        super.onCreate();
        new Instabug.Builder(CustomFlutterApplication.this, token)
                .setInvocationEvents(InstabugInvocationEvent.SHAKE, InstabugInvocationEvent.SCREENSHOT)
                .build();
        Instabug.setWelcomeMessageState(WelcomeMessage.State.DISABLED);

        CrashReporting.setState(Feature.State.DISABLED);
        BugReporting.setReportTypes(BugReporting.ReportType.BUG, BugReporting.ReportType.FEEDBACK);
    }
}
