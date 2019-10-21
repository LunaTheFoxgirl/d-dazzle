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
module dazzle.FileTransfer;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/** */
public class FileTransfer : ObjectG
{
	/** the main Gtk struct */
	protected DzlFileTransfer* dzlFileTransfer;

	/** Get the main Gtk struct */
	public DzlFileTransfer* getFileTransferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlFileTransfer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlFileTransfer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlFileTransfer* dzlFileTransfer, bool ownedRef = false)
	{
		this.dzlFileTransfer = dzlFileTransfer;
		super(cast(GObject*)dzlFileTransfer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_file_transfer_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_file_transfer_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlFileTransfer*) p, true);
	}

	/** */
	public void add(FileIF src, FileIF dest)
	{
		dzl_file_transfer_add(dzlFileTransfer, (src is null) ? null : src.getFileStruct(), (dest is null) ? null : dest.getFileStruct());
	}

	/** */
	public bool execute(int ioPriority, Cancellable cancellable)
	{
		GError* err = null;

		auto p = dzl_file_transfer_execute(dzlFileTransfer, ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public void executeAsync(int ioPriority, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		dzl_file_transfer_execute_async(dzlFileTransfer, ioPriority, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/** */
	public bool executeFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto p = dzl_file_transfer_execute_finish(dzlFileTransfer, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public DzlFileTransferFlags getFlags()
	{
		return dzl_file_transfer_get_flags(dzlFileTransfer);
	}

	/** */
	public double getProgress()
	{
		return dzl_file_transfer_get_progress(dzlFileTransfer);
	}

	/** */
	public void setFlags(DzlFileTransferFlags flags)
	{
		dzl_file_transfer_set_flags(dzlFileTransfer, flags);
	}

	/**
	 * Gets statistics about the transfer progress.
	 *
	 * Params:
	 *     statBuf = a #DzlFileTransferStat
	 *
	 * Since: 3.28
	 */
	public void stat(out DzlFileTransferStat statBuf)
	{
		dzl_file_transfer_stat(dzlFileTransfer, &statBuf);
	}
}
