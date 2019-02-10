# -*- coding: utf-8 -*-

Plugin.create :sound_fav do
  filter_favorite do |service, user, message|
    # ふぁぼられ音を鳴らす
    if UserConfig[:notify_sound_favorited]
      soundfile = UserConfig[:notify_sound_favorited]
      if soundfile.respond_to?(:to_s) && FileTest.exist?(soundfile.to_s)
        Plugin.call(:play_sound, soundfile)
      end
    end
    [service, user, message]
  end
end
