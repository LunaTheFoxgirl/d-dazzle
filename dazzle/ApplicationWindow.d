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
module dazzle.ApplicationWindow;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gobject.ObjectG;
private import gtk.ApplicationWindow : GtkAppWindow = ApplicationWindow;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;
private import dazzle.Application;
private import glib.ConstructionException;


/** */
public class ApplicationWindow : GtkAppWindow
{
	/** the main Gtk struct */
	protected DzlApplicationWindow* dzlApplicationWindow;

	/** Get the main Gtk struct */
	public DzlApplicationWindow* getDazzleApplicationWindowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlApplicationWindow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlApplicationWindow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlApplicationWindow* dzlApplicationWindow, bool ownedRef = false)
	{
		this.dzlApplicationWindow = dzlApplicationWindow;
		super(cast(GtkApplicationWindow*)dzlApplicationWindow, ownedRef);
	}

	/**
	 * Allows subclasses to create new instances of Dazzle applications
	 * This is a frontend to g_object_new
	 */
	protected this (Application app)
	{
		import gobject.c.functions : g_object_new;
		auto p = g_object_new(getType(), 
			Str.toStringz("application"), app.getDazzleApplicationStruct(), null);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlApplicationWindow*) p);
	}

	/** */
	public static GType getType()
	{
		return dzl_application_window_get_type();
	}

	/**
	 * Gets if the window is in the fullscreen state.
	 *
	 * Returns: %TRUE if @self is fullscreen, otherwise %FALSE.
	 *
	 * Since: 3.26
	 */
	public bool getFullscreen()
	{
		return dzl_application_window_get_fullscreen(dzlApplicationWindow) != 0;
	}

	/**
	 * Gets the titlebar for the window, if there is one.
	 *
	 * Returns: A #GtkWidget or %NULL
	 *
	 * Since: 3.26
	 */
	public override Widget getTitlebar()
	{
		auto p = dzl_application_window_get_titlebar(dzlApplicationWindow);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Sets the #DzlApplicationWindow into either the fullscreen or unfullscreen
	 * state based on @fullscreen.
	 *
	 * The titlebar for the window is contained within a #GtkRevealer which is
	 * repurposed as a floating bar when the application is in fullscreen mode.
	 *
	 * See dzl_application_window_get_fullscreen() to get the current fullscreen
	 * state.
	 *
	 * Params:
	 *     fullscreen = if the window should be in the fullscreen state
	 *
	 * Since: 3.26
	 */
	public void setFullscreen(bool fullscreen)
	{
		dzl_application_window_set_fullscreen(dzlApplicationWindow, fullscreen);
	}

	/**
	 * Sets the titlebar for the window.
	 *
	 * Generally, you want to do this from your GTK ui template by setting
	 * the &lt;child type="titlebar"&gt;
	 *
	 * Since: 3.26
	 */
	public override void setTitlebar(Widget titlebar)
	{
		dzl_application_window_set_titlebar(dzlApplicationWindow, (titlebar is null) ? null : titlebar.getWidgetStruct());
	}
}
