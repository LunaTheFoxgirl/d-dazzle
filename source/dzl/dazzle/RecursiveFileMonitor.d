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
module dazzle.RecursiveFileMonitor;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/** */
public class RecursiveFileMonitor : ObjectG
{
	/** the main Gtk struct */
	protected DzlRecursiveFileMonitor* dzlRecursiveFileMonitor;

	/** Get the main Gtk struct */
	public DzlRecursiveFileMonitor* getRecursiveFileMonitorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlRecursiveFileMonitor;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlRecursiveFileMonitor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlRecursiveFileMonitor* dzlRecursiveFileMonitor, bool ownedRef = false)
	{
		this.dzlRecursiveFileMonitor = dzlRecursiveFileMonitor;
		super(cast(GObject*)dzlRecursiveFileMonitor, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_recursive_file_monitor_get_type();
	}

	/** */
	public this(FileIF root)
	{
		auto p = dzl_recursive_file_monitor_new((root is null) ? null : root.getFileStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlRecursiveFileMonitor*) p, true);
	}

	/**
	 * Cancels the recursive file monitor.
	 *
	 * Since: 3.28
	 */
	public void cancel()
	{
		dzl_recursive_file_monitor_cancel(dzlRecursiveFileMonitor);
	}

	/**
	 * Gets the root directory used forthe file monitor.
	 *
	 * Returns: a #GFile
	 *
	 * Since: 3.28
	 */
	public FileIF getRoot()
	{
		auto p = dzl_recursive_file_monitor_get_root(dzlRecursiveFileMonitor);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) p);
	}

	/**
	 * Sets a callback function to determine if a #GFile should be ignored
	 * from signal emission.
	 *
	 * @ignore_func will always be called from the applications main thread.
	 *
	 * If @ignore_func is %NULL, it is set to the default which does not
	 * ignore any files or directories.
	 *
	 * Params:
	 *     ignoreFunc = a #DzlRecursiveIgnoreFunc
	 *     ignoreFuncData = closure data for @ignore_func
	 *     ignoreFuncDataDestroy = destroy notify for @ignore_func_data
	 *
	 * Since: 3.28
	 */
	public void setIgnoreFunc(DzlRecursiveIgnoreFunc ignoreFunc, void* ignoreFuncData, GDestroyNotify ignoreFuncDataDestroy)
	{
		dzl_recursive_file_monitor_set_ignore_func(dzlRecursiveFileMonitor, ignoreFunc, ignoreFuncData, ignoreFuncDataDestroy);
	}

	/** */
	public void startAsync(Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		dzl_recursive_file_monitor_start_async(dzlRecursiveFileMonitor, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/** */
	public bool startFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto p = dzl_recursive_file_monitor_start_finish(dzlRecursiveFileMonitor, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * This event is similar to #GFileMonitor::changed but can be fired from
	 * any of the monitored directories in the recursive mount.
	 *
	 * Params:
	 *     file = a #GFile
	 *     otherFile = a #GFile for the other file when applicable
	 *     event = the #GFileMonitorEvent event
	 *
	 * Since: 3.28
	 */
	gulong addOnChanged(void delegate(FileIF, FileIF, GFileMonitorEvent, RecursiveFileMonitor) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
