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
module dazzle.ProgressButton;

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
private import gtk.Button;
private import gtk.Widget;


/** */
public class ProgressButton : Button
{
	/** the main Gtk struct */
	protected DzlProgressButton* dzlProgressButton;

	/** Get the main Gtk struct */
	public DzlProgressButton* getProgressButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlProgressButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlProgressButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlProgressButton* dzlProgressButton, bool ownedRef = false)
	{
		this.dzlProgressButton = dzlProgressButton;
		super(cast(GtkButton*)dzlProgressButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_progress_button_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_progress_button_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlProgressButton*) p);
	}

	/** */
	public uint getProgress()
	{
		return dzl_progress_button_get_progress(dzlProgressButton);
	}

	/** */
	public bool getShowProgress()
	{
		return dzl_progress_button_get_show_progress(dzlProgressButton) != 0;
	}

	/** */
	public void setProgress(uint percentage)
	{
		dzl_progress_button_set_progress(dzlProgressButton, percentage);
	}

	/** */
	public void setShowProgress(bool showProgress)
	{
		dzl_progress_button_set_show_progress(dzlProgressButton, showProgress);
	}
}
