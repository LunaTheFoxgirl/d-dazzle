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
module dazzle.DockManager;

private import dazzle.DockIF;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/** */
public class DockManager : ObjectG
{
	/** the main Gtk struct */
	protected DzlDockManager* dzlDockManager;

	/** Get the main Gtk struct */
	public DzlDockManager* getDockManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockManager* dzlDockManager, bool ownedRef = false)
	{
		this.dzlDockManager = dzlDockManager;
		super(cast(GObject*)dzlDockManager, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_dock_manager_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_dock_manager_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDockManager*) p, true);
	}

	/**
	 * Requests that the transient grab monitoring stop until
	 * dzl_dock_manager_unpause_grabs() is called.
	 *
	 * This might be useful while setting up UI so that you don't focus
	 * something unexpectedly.
	 *
	 * This function may be called multiple times and after an equivalent
	 * number of calls to dzl_dock_manager_unpause_grabs(), transient
	 * grab monitoring will continue.
	 *
	 * Since: 3.26
	 */
	public void pauseGrabs()
	{
		dzl_dock_manager_pause_grabs(dzlDockManager);
	}

	/** */
	public void registerDock(DockIF dock)
	{
		dzl_dock_manager_register_dock(dzlDockManager, (dock is null) ? null : dock.getDockStruct());
	}

	/** */
	public void releaseTransientGrab()
	{
		dzl_dock_manager_release_transient_grab(dzlDockManager);
	}

	/**
	 * Unpauses a previous call to dzl_dock_manager_pause_grabs().
	 *
	 * Once the pause count returns to zero, transient grab monitoring
	 * will be restored.
	 *
	 * Since: 3.26
	 */
	public void unpauseGrabs()
	{
		dzl_dock_manager_unpause_grabs(dzlDockManager);
	}

	/** */
	public void unregisterDock(DockIF dock)
	{
		dzl_dock_manager_unregister_dock(dzlDockManager, (dock is null) ? null : dock.getDockStruct());
	}

	/** */
	gulong addOnRegisterDock(void delegate(DockIF, DockManager) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "register-dock", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnUnregisterDock(void delegate(DockIF, DockManager) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "unregister-dock", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
