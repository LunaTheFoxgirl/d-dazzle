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
module dazzle.DirectoryModel;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.FileIF;
private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class DirectoryModel : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected DzlDirectoryModel* dzlDirectoryModel;

	/** Get the main Gtk struct */
	public DzlDirectoryModel* getDirectoryModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDirectoryModel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDirectoryModel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDirectoryModel* dzlDirectoryModel, bool ownedRef = false)
	{
		this.dzlDirectoryModel = dzlDirectoryModel;
		super(cast(GObject*)dzlDirectoryModel, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(DzlDirectoryModel);


	/** */
	public static GType getType()
	{
		return dzl_directory_model_get_type();
	}

	/**
	 * Creates a new #DzlDirectoryModel using @directory as the directory to monitor.
	 *
	 * Params:
	 *     directory = A #GFile
	 *
	 * Returns: A newly created #DzlDirectoryModel
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(FileIF directory)
	{
		auto p = dzl_directory_model_new((directory is null) ? null : directory.getFileStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDirectoryModel*) p, true);
	}

	/**
	 * Gets the directory the model is observing.
	 *
	 * Returns: A #GFile
	 */
	public FileIF getDirectory()
	{
		auto p = dzl_directory_model_get_directory(dzlDirectoryModel);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) p);
	}

	/** */
	public void setDirectory(FileIF directory)
	{
		dzl_directory_model_set_directory(dzlDirectoryModel, (directory is null) ? null : directory.getFileStruct());
	}

	/** */
	public void setVisibleFunc(DzlDirectoryModelVisibleFunc visibleFunc, void* userData, GDestroyNotify userDataFreeFunc)
	{
		dzl_directory_model_set_visible_func(dzlDirectoryModel, visibleFunc, userData, userDataFreeFunc);
	}
}
