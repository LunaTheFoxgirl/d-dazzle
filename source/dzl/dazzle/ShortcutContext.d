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
module dazzle.ShortcutContext;

private import dazzle.ShortcutChord;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ArrayG;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Value;
private import gtk.Widget;


/** */
public class ShortcutContext : ObjectG
{
	/** the main Gtk struct */
	protected DzlShortcutContext* dzlShortcutContext;

	/** Get the main Gtk struct */
	public DzlShortcutContext* getShortcutContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutContext* dzlShortcutContext, bool ownedRef = false)
	{
		this.dzlShortcutContext = dzlShortcutContext;
		super(cast(GObject*)dzlShortcutContext, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_context_get_type();
	}

	/** */
	public this(string name)
	{
		auto p = dzl_shortcut_context_new(Str.toStringz(name));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutContext*) p, true);
	}

	/** */
	public DzlShortcutMatch activate(Widget widget, ShortcutChord chord)
	{
		return dzl_shortcut_context_activate(dzlShortcutContext, (widget is null) ? null : widget.getWidgetStruct(), (chord is null) ? null : chord.getShortcutChordStruct());
	}

	/** */
	public void addAction(string accel, string detailedActionName)
	{
		dzl_shortcut_context_add_action(dzlShortcutContext, Str.toStringz(accel), Str.toStringz(detailedActionName));
	}

	/** */
	public void addCommand(string accel, string command)
	{
		dzl_shortcut_context_add_command(dzlShortcutContext, Str.toStringz(accel), Str.toStringz(command));
	}

	/** */
	public void addSignalVaList(string accel, string signalName, uint nArgs, void* args)
	{
		dzl_shortcut_context_add_signal_va_list(dzlShortcutContext, Str.toStringz(accel), Str.toStringz(signalName), nArgs, args);
	}

	/**
	 * This is similar to dzl_shortcut_context_add_signal() but is easier to use
	 * from language bindings.
	 *
	 * Params:
	 *     accel = the accelerator for the shortcut
	 *     signalName = the name of the signal
	 *     values = The
	 *         values to use when calling the signal.
	 */
	public void addSignalv(string accel, string signalName, ArrayG values)
	{
		dzl_shortcut_context_add_signalv(dzlShortcutContext, Str.toStringz(accel), Str.toStringz(signalName), (values is null) ? null : values.getArrayGStruct());
	}

	/** */
	public string getName()
	{
		return Str.toString(dzl_shortcut_context_get_name(dzlShortcutContext));
	}

	/** */
	public bool loadFromData(string data, ptrdiff_t len)
	{
		GError* err = null;

		auto p = dzl_shortcut_context_load_from_data(dzlShortcutContext, Str.toStringz(data), len, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public bool loadFromResource(string resourcePath)
	{
		GError* err = null;

		auto p = dzl_shortcut_context_load_from_resource(dzlShortcutContext, Str.toStringz(resourcePath), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public bool remove(string accel)
	{
		return dzl_shortcut_context_remove(dzlShortcutContext, Str.toStringz(accel)) != 0;
	}
}
