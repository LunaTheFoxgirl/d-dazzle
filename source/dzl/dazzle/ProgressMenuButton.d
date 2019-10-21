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
module dazzle.ProgressMenuButton;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.ActionableIF;
private import gtk.ActionableT;
private import gtk.ActivatableIF;
private import gtk.ActivatableT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.MenuButton;
private import gtk.Widget;


/** */
public class ProgressMenuButton : MenuButton
{
	/** the main Gtk struct */
	protected DzlProgressMenuButton* dzlProgressMenuButton;

	/** Get the main Gtk struct */
	public DzlProgressMenuButton* getProgressMenuButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlProgressMenuButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlProgressMenuButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlProgressMenuButton* dzlProgressMenuButton, bool ownedRef = false)
	{
		this.dzlProgressMenuButton = dzlProgressMenuButton;
		super(cast(GtkMenuButton*)dzlProgressMenuButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_progress_menu_button_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_progress_menu_button_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlProgressMenuButton*) p);
	}

	/** */
	public double getProgress()
	{
		return dzl_progress_menu_button_get_progress(dzlProgressMenuButton);
	}

	/** */
	public bool getShowProgress()
	{
		return dzl_progress_menu_button_get_show_progress(dzlProgressMenuButton) != 0;
	}

	/** */
	public bool getShowTheatric()
	{
		return dzl_progress_menu_button_get_show_theatric(dzlProgressMenuButton) != 0;
	}

	/**
	 * To avoid suprious animations from the button, you must call this function any
	 * time you want to allow animations to continue. This is because animations are
	 * automatically started upon reaching a progress of 1.0.
	 *
	 * If you are performing operations in the background, calling this function
	 * every time you add an operation is a good strategry.
	 */
	public void resetTheatrics()
	{
		dzl_progress_menu_button_reset_theatrics(dzlProgressMenuButton);
	}

	/** */
	public void setProgress(double progress)
	{
		dzl_progress_menu_button_set_progress(dzlProgressMenuButton, progress);
	}

	/** */
	public void setShowProgress(bool showProgress)
	{
		dzl_progress_menu_button_set_show_progress(dzlProgressMenuButton, showProgress);
	}

	/** */
	public void setShowTheatric(bool showTheatic)
	{
		dzl_progress_menu_button_set_show_theatric(dzlProgressMenuButton, showTheatic);
	}
}
