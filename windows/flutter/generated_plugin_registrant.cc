//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <audio_progress_bars/audio_progress_bars_plugin.h>
#include <connectivity_plus/connectivity_plus_windows_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  AudioProgressBarsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AudioProgressBarsPlugin"));
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
}
