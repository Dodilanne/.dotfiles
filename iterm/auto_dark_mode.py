#!/usr/bin/env python3

import iterm2


async def changeTheme(connection, parts):
    theme_dark = "rose-pine"
    theme_light = "rose-pine-dawn"

    wallpapers_path = (
        "/Users/dodi/Library/CloudStorage/OneDrive-Personal/Photos/Wallpapers/iterm"
    )

    bg_image_dark = None  # "bg_dark.jpg"
    bg_image_light = None

    if "dark" in parts:
        preset = await iterm2.ColorPreset.async_get(connection, theme_dark)
        bg_image = f"{wallpapers_path}/{bg_image_dark}" if bg_image_dark else ""
    else:
        preset = await iterm2.ColorPreset.async_get(connection, theme_light)
        bg_image = f"{wallpapers_path}/{bg_image_light}" if bg_image_light else ""

    # Update the list of all profiles and iterate over them.
    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        # Fetch the ull profile and then set the color preset in it.
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)
        # Update background image
        await profile.async_set_background_image_location(bg_image)


async def main(connection):
    app = await iterm2.async_get_app(connection)
    initial_theme = await app.async_get_theme()
    await changeTheme(connection, initial_theme)

    async with iterm2.VariableMonitor(
        connection, iterm2.VariableScopes.APP, "effectiveTheme", None
    ) as mon:
        while True:
            # Block until theme changes
            theme = await mon.async_get()
            # Themes have space-delimited attributes, one of which will be light or dark.
            parts = theme.split(" ")

            await changeTheme(connection, parts)


iterm2.run_forever(main)
