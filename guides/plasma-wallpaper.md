# How to display your own wallpaper collection in Plasma's wallpaper window

Thanks to a nice feature like symlinks in Linux, we can use them in `$XDG_DATA_HOME` (aka `$HOME/.local/share`). If you are wondering why this folder, I will remind you that `$XDG_DATA_HOME` is a user-side representation of `/usr/share` (well, sort of).

And so, now I'll show you by example. I have the latest KDE Plasma 6.3 installed on CachyOS. This is a cleanest system where only the icons have been changed to Papirus. 

Now let's open the desktop wallpaper dialog and make sure that there is nothing but the standard KDE wallpapers there.

![image](https://github.com/user-attachments/assets/9307465f-c7c5-4497-b1eb-87e222b82eec)

Now let's go to `$XDG_DATA_HOME` and create a symlink to our wallpaper collection.
Note that the symlink name must be in lower case.

[screencast.webm](https://github.com/user-attachments/assets/b4b036d5-e2ab-45fe-954f-6fd5dc09e98c)

Now we open the wallpaper selection dialog again, and see all of our wallpapers.

![image](https://github.com/user-attachments/assets/ff7f7ddd-ad2e-41ff-8999-cfb54e418596)

**But this method has a few downsides**:

- If you sort your wallpapers carefully and nicely (as I do), it won't do any good, because KDE lumps them all into one pile. This is not a KDE problem, it's the design of the wallpaper selection window.
- Due to the large amount of wallpapers, thumbnails loading and scrolling will be very slow. Sometimes the window may crash due to intensive scrolling.

However, unless you have several **gigabytes** of wallpaper, you don't have to worry about possible lags. 

That's it. You have now learned how to integrate your personal wallpaper library directly into KDE.
