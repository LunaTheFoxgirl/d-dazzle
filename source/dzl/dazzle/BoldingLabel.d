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
module dazzle.BoldingLabel;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Label;


/** */
public class BoldingLabel : Label
{
	/** the main Gtk struct */
	protected DzlBoldingLabel* dzlBoldingLabel;

	/** Get the main Gtk struct */
	public DzlBoldingLabel* getBoldingLabelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlBoldingLabel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlBoldingLabel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlBoldingLabel* dzlBoldingLabel, bool ownedRef = false)
	{
		this.dzlBoldingLabel = dzlBoldingLabel;
		super(cast(GtkLabel*)dzlBoldingLabel, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_bolding_label_get_type();
	}

	/** */
	public this(string str, bool bold)
	{
		auto p = dzl_bolding_label_new(Str.toStringz(str), bold);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlBoldingLabel*) p);
	}

	/** */
	public this(string str, bool bold)
	{
		auto p = dzl_bolding_label_new_with_mnemonic(Str.toStringz(str), bold);

		if(p is null)
		{
			throw new ConstructionException("null returned by new_with_mnemonic");
		}

		this(cast(DzlBoldingLabel*) p);
	}

	/** */
	public void setBold(bool bold)
	{
		dzl_bolding_label_set_bold(dzlBoldingLabel, bold);
	}

	/** */
	public void setWeight(PangoWeight weight)
	{
		dzl_bolding_label_set_weight(dzlBoldingLabel, weight);
	}
}
