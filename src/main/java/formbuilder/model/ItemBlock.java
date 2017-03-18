package formbuilder.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

/*
 * A form block that contains a list of generic form Items
 */
@Entity
@Table(name = "item_blocks")
public class ItemBlock implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue
	protected int id;
	
	protected String name;
	
	protected String description;
	
	protected boolean available;
	
    protected int index;
	
	@OneToMany(cascade = { CascadeType.MERGE, CascadeType.PERSIST })	
	@JoinColumn(name = "item_block_id")
    @OrderColumn(name = "item_index")
	protected List<Item> items;
	
	public ItemBlock() {
		items = new ArrayList<Item>();
	}
	
	public ItemBlock duplicate() {
		ItemBlock newItemBlock = new ItemBlock();
		
		newItemBlock.name = name;
		newItemBlock.description = description;
		newItemBlock.available = available;
		newItemBlock.index = index;
		for ( Item item : items ) {
			newItemBlock.items.add( item.duplicate() );
		}
		
		return newItemBlock;
	}
	
	public Item getItem( int itemId ) {
		for ( Item item : items ) {
			if ( item.getId() == itemId ) {
				return item;
			}
		}
		return null;
	}
	
	public Item deleteItem( int itemId ) {
		for (int i = 0; i < items.size(); i++) {
			if ( items.get(i).getId() == itemId ) {
				return items.remove( i );
			}
		}
		return null;
	}
	
	// TODO: void replaceItem( Item item )

	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
}