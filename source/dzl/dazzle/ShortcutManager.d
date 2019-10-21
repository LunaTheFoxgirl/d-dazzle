/*
 * This file is part of d-dazzle.
 *
 * d-dazzle is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * d-dazzle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with d-dazzle; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
module dazzle.ShortcutManager;

private import dazzle.ShortcutTheme;
private import dazzle.ShortcutsWindow;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.Cancellable;
private import gio.InitableIF;
private import gio.InitableT;
private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Widget;
private import std.algorithm;


/** */
public class ShortcutManager : ObjectG, InitableIF, ListModelIF
{
	/** the main Gtk struct */
	protected DzlShortcutManager* dzlShortcutManager;

	/** Get the main Gtk struct */
	public DzlShortcutManager* getShortcutManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutManager* dzlShortcutManager, bool ownedRef = false)
	{
		this.dzlShortcutManager = dzlShortcutManager;
		super(cast(GObject*)dzlShortcutManager, ownedRef);
	}

	// add the Initable capabilities
	mixin InitableT!(DzlShortcutManager);

	// add the ListModel capabilities
	mixin ListModelT!(DzlShortcutManager);


	/** */
	public static GType getType()
	{
		return dzl_shortcut_manager_get_type();
	}

	/**
	 * Gets the singleton #DzlShortcutManager for the process.
	 *
	 * Returns: An #DzlShortcutManager.
	 */
	public static ShortcutManager getDefault()
	{
		auto p = dzl_shortcut_manager_get_default();

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutManager)(cast(DzlShortcutManager*) p);
	}

	/** */
	public void addAction(string detailedActionName, string section, string group, string title, string subtitle)
	{
		dzl_shortcut_manager_add_action(dzlShortcutManager, Str.toStringz(detailedActionName), Str.toStringz(section), Str.toStringz(group), Str.toStringz(title), Str.toStringz(subtitle));
	}

	/** */
	public void addCommand(string command, string section, string group, string title, string subtitle)
	{
		dzl_shortcut_manager_add_command(dzlShortcutManager, Str.toStringz(command), Str.toStringz(section), Str.toStringz(group), Str.toStringz(title), Str.toStringz(subtitle));
	}

	/**
	 * This method will add @shortcuts to the #DzlShortcutManager.
	 *
	 * This provides a simple way for widgets to add their shortcuts to the manager
	 * so that they may be overriden by themes or the end user.
	 *
	 * Params:
	 *     shortcuts = shortcuts to add
	 *     translationDomain = the gettext domain to use for translations
	 */
	public void addShortcutEntries(DzlShortcutEntry[] shortcuts, string translationDomain)
	{
		dzl_shortcut_manager_add_shortcut_entries(dzlShortcutManager, shortcuts.ptr, cast(uint)shortcuts.length, Str.toStringz(translationDomain));
	}

	/**
	 * Adds shortcuts registered with the #DzlShortcutManager to the
	 * #DzlShortcutsWindow.
	 *
	 * Params:
	 *     window = A #DzlShortcutsWindow
	 */
	public void addShortcutsToWindow(ShortcutsWindow window)
	{
		dzl_shortcut_manager_add_shortcuts_to_window(dzlShortcutManager, (window is null) ? null : window.getShortcutsWindowStruct());
	}

	/** */
	public void appendSearchPath(string directory)
	{
		dzl_shortcut_manager_append_search_path(dzlShortcutManager, Str.toStringz(directory));
	}

	/**
	 * Gets the "theme" property.
	 *
	 * Returns: An #DzlShortcutTheme.
	 */
	public ShortcutTheme getTheme()
	{
		auto p = dzl_shortcut_manager_get_theme(dzlShortcutManager);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutTheme)(cast(DzlShortcutTheme*) p);
	}

	/**
	 * Locates a theme by the name of the theme.
	 *
	 * If @theme_name is %NULL, then the internal theme is used. You probably dont
	 * need to use that as it is used by various controllers to hook up their
	 * default actions.
	 *
	 * Params:
	 *     themeName = the name of a theme or %NULL of the internal theme
	 *
	 * Returns: A #DzlShortcutTheme or %NULL.
	 */
	public ShortcutTheme getThemeByName(string themeName)
	{
		auto p = dzl_shortcut_manager_get_theme_by_name(dzlShortcutManager, Str.toStringz(themeName));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutTheme)(cast(DzlShortcutTheme*) p);
	}

	/** */
	public string getThemeName()
	{
		return Str.toString(dzl_shortcut_manager_get_theme_name(dzlShortcutManager));
	}

	/** */
	public string getUserDir()
	{
		return Str.toString(dzl_shortcut_manager_get_user_dir(dzlShortcutManager));
	}

	/**
	 * This function will try to dispatch @event to the proper widget and
	 * #DzlShortcutContext. If the event is handled, then %TRUE is returned.
	 *
	 * You should call this from #GtkWidget::key-press-event handler in your
	 * #GtkWindow toplevel.
	 *
	 * Params:
	 *     event = A #GdkEventKey event to handle.
	 *     toplevel = A #GtkWidget or %NULL.
	 *
	 * Returns: %TRUE if the event was handled.
	 */
	public bool handleEvent(GdkEventKey* event, Widget toplevel)
	{
		return dzl_shortcut_manager_handle_event(dzlShortcutManager, event, (toplevel is null) ? null : toplevel.getWidgetStruct()) != 0;
	}

	/** */
	public void prependSearchPath(string directory)
	{
		dzl_shortcut_manager_prepend_search_path(dzlShortcutManager, Str.toStringz(directory));
	}

	/** */
	public void queueReload()
	{
		dzl_shortcut_manager_queue_reload(dzlShortcutManager);
	}

	/** */
	public void reload(Cancellable cancellable)
	{
		dzl_shortcut_manager_reload(dzlShortcutManager, (cancellable is null) ? null : cancellable.getCancellableStruct());
	}

	/** */
	public void removeSearchPath(string directory)
	{
		dzl_shortcut_manager_remove_search_path(dzlShortcutManager, Str.toStringz(directory));
	}

	/**
	 * Sets the theme for the shortcut manager.
	 *
	 * Params:
	 *     theme = An #DzlShortcutTheme
	 */
	public void setTheme(ShortcutTheme theme)
	{
		dzl_shortcut_manager_set_theme(dzlShortcutManager, (theme is null) ? null : theme.getShortcutThemeStruct());
	}

	/** */
	public void setThemeName(string themeName)
	{
		dzl_shortcut_manager_set_theme_name(dzlShortcutManager, Str.toStringz(themeName));
	}

	/** */
	public void setUserDir(string userDir)
	{
		dzl_shortcut_manager_set_user_dir(dzlShortcutManager, Str.toStringz(userDir));
	}

	/** */
	gulong addOnChanged(void delegate(ShortcutManager) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
