package formbuilder.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity(name = "item_selection")
public class ItemSelection extends Item implements Serializable {
	
    private static final long serialVersionUID = 1L;

    @OneToMany(mappedBy="item",cascade=CascadeType.ALL)
    @Column(name="selection")
    private List<Selection> selections;
    
    @OneToOne(cascade=CascadeType.ALL)
    private ItemSelectionAnswer answer;
    
    @Column(name="min")
    private int minRequirements; // (ex. Needs to pick at least 1)
    
    @Column(name="max")
    private int maxSelectionNum; //(ex. maximum number to select, can be select 2 out of 5, so max=2)}
    
    public List<Selection> getSelections() {
        return selections;
    }

    public void setSelections(List<Selection> selections) {
        this.selections = selections;
    }

    public int getMinRequirements() {
		return minRequirements;
	}

	public void setMinRequirements(int minRequirements) {
		this.minRequirements = minRequirements;
	}

	public int getMaxSelectionNum() {
		return maxSelectionNum;
	}

	public void setMaxSelectionNum(int maxSelectionNum) {
		this.maxSelectionNum = maxSelectionNum;
	}

	public ItemSelectionAnswer getAnswer() {
        return answer;
    }

    public void setAnswer(ItemSelectionAnswer answer) {
        this.answer = answer;
    }

	@Override
	public Item duplicate() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ItemType getItemType() {
		// TODO Auto-generated method stub
		return null;
	} 
}
