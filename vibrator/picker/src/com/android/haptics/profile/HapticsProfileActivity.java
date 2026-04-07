/*
 * Copyright (C) 2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

package com.android.haptics.profile;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;
import android.os.SystemProperties;
import android.provider.Settings;

public class HapticsProfileActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        final String propKey = getString(R.string.config_hapticProfilePropKey);

        final String[] entries = getResources().getStringArray(R.array.haptic_effect_style_entries);
        final String[] values = getResources().getStringArray(R.array.haptic_effect_style_values);

        // Read current value from persist prop, fall back to first entry default
        final String current = SystemProperties.get(propKey, values[0]);
        int selected = 0;
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(current)) {
                selected = i;
                break;
            }
        }

        new AlertDialog.Builder(this)
            .setTitle(R.string.haptics_profile_title)
            .setSingleChoiceItems(entries, selected, (dialog, which) -> {
                SystemProperties.set(propKey, values[which]);
                dialog.dismiss();
                finish();
            })
            .setNegativeButton(R.string.haptics_profile_cancel, (d, w) -> finish())
            .setOnCancelListener(d -> finish())
            .show();
    }
}
