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
module dazzle.DirectoryReaper;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/** */
public class DirectoryReaper : ObjectG
{
	/** the main Gtk struct */
	protected DzlDirectoryReaper* dzlDirectoryReaper;

	/** Get the main Gtk struct */
	public DzlDirectoryReaper* getDirectoryReaperStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDirectoryReaper;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDirectoryReaper;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDirectoryReaper* dzlDirectoryReaper, bool ownedRef = false)
	{
		this.dzlDirectoryReaper = dzlDirectoryReaper;
		super(cast(GObject*)dzlDirectoryReaper, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_directory_reaper_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_directory_reaper_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDirectoryReaper*) p, true);
	}

	/** */
	public void addDirectory(FileIF directory, GTimeSpan minAge)
	{
		dzl_directory_reaper_add_directory(dzlDirectoryReaper, (directory is null) ? null : directory.getFileStruct(), minAge);
	}

	/** */
	public void addFile(FileIF file, GTimeSpan minAge)
	{
		dzl_directory_reaper_add_file(dzlDirectoryReaper, (file is null) ? null : file.getFileStruct(), minAge);
	}

	/** */
	public void addGlob(FileIF directory, string glob, GTimeSpan minAge)
	{
		dzl_directory_reaper_add_glob(dzlDirectoryReaper, (directory is null) ? null : directory.getFileStruct(), Str.toStringz(glob), minAge);
	}

	/** */
	public bool execute(Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_directory_reaper_execute(dzlDirectoryReaper, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public void executeAsync(Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		dzl_directory_reaper_execute_async(dzlDirectoryReaper, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/** */
	public bool executeFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto p = dzl_directory_reaper_execute_finish(dzlDirectoryReaper, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * The "remove-file" signal is emitted for each file that is removed by the
	 * #DzlDirectoryReaper instance. This may be useful if you want to show the
	 * user what was processed by the reaper.
	 *
	 * Params:
	 *     file = a #GFile
	 *
	 * Since: 3.32
	 */
	gulong addOnRemoveFile(void delegate(FileIF, DirectoryReaper) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "remove-file", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
