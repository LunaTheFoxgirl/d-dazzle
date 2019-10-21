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
module dazzle.ShortcutTheme;

private import dazzle.ShortcutChord;
private import dazzle.ShortcutContext;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.Cancellable;
private import gio.FileIF;
private import gio.OutputStream;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Widget;


/** */
public class ShortcutTheme : ObjectG
{
	/** the main Gtk struct */
	protected DzlShortcutTheme* dzlShortcutTheme;

	/** Get the main Gtk struct */
	public DzlShortcutTheme* getShortcutThemeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutTheme;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutTheme;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutTheme* dzlShortcutTheme, bool ownedRef = false)
	{
		this.dzlShortcutTheme = dzlShortcutTheme;
		super(cast(GObject*)dzlShortcutTheme, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_theme_get_type();
	}

	/** */
	public this(string name)
	{
		auto p = dzl_shortcut_theme_new(Str.toStringz(name));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutTheme*) p, true);
	}

	/** */
	public void addCommand(string accelerator, string command)
	{
		dzl_shortcut_theme_add_command(dzlShortcutTheme, Str.toStringz(accelerator), Str.toStringz(command));
	}

	/** */
	public void addContext(ShortcutContext context)
	{
		dzl_shortcut_theme_add_context(dzlShortcutTheme, (context is null) ? null : context.getShortcutContextStruct());
	}

	/** */
	public void addCssResource(string path)
	{
		dzl_shortcut_theme_add_css_resource(dzlShortcutTheme, Str.toStringz(path));
	}

	/**
	 * Gets the context named @name. If the context does not exist, it will
	 * be created.
	 *
	 * Params:
	 *     name = The name of the context
	 *
	 * Returns: An #DzlShortcutContext
	 */
	public ShortcutContext findContextByName(string name)
	{
		auto p = dzl_shortcut_theme_find_context_by_name(dzlShortcutTheme, Str.toStringz(name));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutContext)(cast(DzlShortcutContext*) p);
	}

	/**
	 * Finds the default context in the theme for @widget.
	 *
	 * Returns: An #DzlShortcutContext or %NULL.
	 */
	public ShortcutContext findDefaultContext(Widget widget)
	{
		auto p = dzl_shortcut_theme_find_default_context(dzlShortcutTheme, (widget is null) ? null : widget.getWidgetStruct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutContext)(cast(DzlShortcutContext*) p);
	}

	/** */
	public ShortcutChord getChordForAction(string detailedActionName)
	{
		auto p = dzl_shortcut_theme_get_chord_for_action(dzlShortcutTheme, Str.toStringz(detailedActionName));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutChord)(cast(DzlShortcutChord*) p);
	}

	/** */
	public ShortcutChord getChordForCommand(string command)
	{
		auto p = dzl_shortcut_theme_get_chord_for_command(dzlShortcutTheme, Str.toStringz(command));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutChord)(cast(DzlShortcutChord*) p);
	}

	/** */
	public string getName()
	{
		return Str.toString(dzl_shortcut_theme_get_name(dzlShortcutTheme));
	}

	/**
	 * If the #DzlShortcutTheme:parent-name property has been set, this will fetch
	 * the parent #DzlShortcutTheme.
	 *
	 * Returns: A #DzlShortcutTheme or %NULL.
	 */
	public ShortcutTheme getParent()
	{
		auto p = dzl_shortcut_theme_get_parent(dzlShortcutTheme);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutTheme)(cast(DzlShortcutTheme*) p);
	}

	/**
	 * Gets the name of the parent shortcut theme.
	 *
	 * This is used to resolve shortcuts from the parent theme without having to
	 * copy them directly into this shortcut theme. It allows for some level of
	 * copy-on-write (CoW).
	 *
	 * Returns: The name of the parent theme, or %NULL if none is set.
	 */
	public string getParentName()
	{
		return Str.toString(dzl_shortcut_theme_get_parent_name(dzlShortcutTheme));
	}

	/** */
	public string getSubtitle()
	{
		return Str.toString(dzl_shortcut_theme_get_subtitle(dzlShortcutTheme));
	}

	/** */
	public string getTitle()
	{
		return Str.toString(dzl_shortcut_theme_get_title(dzlShortcutTheme));
	}

	/** */
	public bool loadFromData(string data, ptrdiff_t len)
	{
		GError* err = null;

		auto p = dzl_shortcut_theme_load_from_data(dzlShortcutTheme, Str.toStringz(data), len, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public bool loadFromFile(FileIF file, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_shortcut_theme_load_from_file(dzlShortcutTheme, (file is null) ? null : file.getFileStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public bool loadFromPath(string path, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_shortcut_theme_load_from_path(dzlShortcutTheme, Str.toStringz(path), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public void removeCssResource(string path)
	{
		dzl_shortcut_theme_remove_css_resource(dzlShortcutTheme, Str.toStringz(path));
	}

	/** */
	public bool saveToFile(FileIF file, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_shortcut_theme_save_to_file(dzlShortcutTheme, (file is null) ? null : file.getFileStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public bool saveToPath(string path, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_shortcut_theme_save_to_path(dzlShortcutTheme, Str.toStringz(path), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public bool saveToStream(OutputStream stream, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_shortcut_theme_save_to_stream(dzlShortcutTheme, (stream is null) ? null : stream.getOutputStreamStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public void setAccelForAction(string detailedActionName, string accel, DzlShortcutPhase phase)
	{
		dzl_shortcut_theme_set_accel_for_action(dzlShortcutTheme, Str.toStringz(detailedActionName), Str.toStringz(accel), phase);
	}

	/**
	 * This will set the command to execute when @accel is pressed.  If command is
	 * %NULL, the accelerator will be cleared.  If accelerator is %NULL, all
	 * accelerators for @command will be cleared.
	 *
	 * Params:
	 *     command = the command to be executed
	 *     accel = the shortcut accelerator
	 *     phase = the phase to activate within, or 0 for the default
	 */
	public void setAccelForCommand(string command, string accel, DzlShortcutPhase phase)
	{
		dzl_shortcut_theme_set_accel_for_command(dzlShortcutTheme, Str.toStringz(command), Str.toStringz(accel), phase);
	}

	/** */
	public void setChordForAction(string detailedActionName, ShortcutChord chord, DzlShortcutPhase phase)
	{
		dzl_shortcut_theme_set_chord_for_action(dzlShortcutTheme, Str.toStringz(detailedActionName), (chord is null) ? null : chord.getShortcutChordStruct(), phase);
	}

	/**
	 * This will set the command to execute when @chord is pressed.  If command is
	 * %NULL, the accelerator will be cleared.  If @chord is %NULL, all
	 * accelerators for @command will be cleared.
	 *
	 * Params:
	 *     command = the command to be executed
	 *     chord = the chord for the command
	 *     phase = the phase to activate within, or 0 for the default
	 */
	public void setChordForCommand(string command, ShortcutChord chord, DzlShortcutPhase phase)
	{
		dzl_shortcut_theme_set_chord_for_command(dzlShortcutTheme, Str.toStringz(command), (chord is null) ? null : chord.getShortcutChordStruct(), phase);
	}

	/** */
	public void setParentName(string parentName)
	{
		dzl_shortcut_theme_set_parent_name(dzlShortcutTheme, Str.toStringz(parentName));
	}
}
