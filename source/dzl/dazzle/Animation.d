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
module dazzle.Animation;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gdk.MonitorG;
private import gobject.ObjectG;
private import gobject.ParamSpec;
private import gobject.Signals;
private import gobject.Value;
private import std.algorithm;


/** */
public class Animation : ObjectG
{
	/** the main Gtk struct */
	protected DzlAnimation* dzlAnimation;

	/** Get the main Gtk struct */
	public DzlAnimation* getAnimationStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlAnimation;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlAnimation;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlAnimation* dzlAnimation, bool ownedRef = false)
	{
		this.dzlAnimation = dzlAnimation;
		super(cast(GObject*)dzlAnimation, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_animation_get_type();
	}

	/** */
	public static uint calculateDuration(MonitorG monitor, double fromValue, double toValue)
	{
		return dzl_animation_calculate_duration((monitor is null) ? null : monitor.getMonitorGStruct(), fromValue, toValue);
	}

	/**
	 * Adds a new property to the set of properties to be animated during the
	 * lifetime of the animation.
	 *
	 * Side effects: None.
	 *
	 * Params:
	 *     pspec = A #ParamSpec of @target or a #GtkWidget<!-- -->'s parent.
	 *     value = The new value for the property at the end of the animation.
	 */
	public void addProperty(ParamSpec pspec, Value value)
	{
		dzl_animation_add_property(dzlAnimation, (pspec is null) ? null : pspec.getParamSpecStruct(), (value is null) ? null : value.getValueStruct());
	}

	/**
	 * Start the animation. When the animation stops, the internal reference will
	 * be dropped and the animation may be finalized.
	 *
	 * Side effects: None.
	 */
	public void start()
	{
		dzl_animation_start(dzlAnimation);
	}

	/**
	 * Stops a running animation. The internal reference to the animation is
	 * dropped and therefore may cause the object to finalize.
	 *
	 * As a convenience, this function accepts %NULL for @animation but
	 * does nothing if that should occur.
	 */
	public void stop()
	{
		dzl_animation_stop(dzlAnimation);
	}

	/**
	 * The "tick" signal is emitted on each frame in the animation.
	 */
	gulong addOnTick(void delegate(Animation) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "tick", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
