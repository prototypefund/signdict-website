 <template>
   <v-autocomplete :keep-open="false" :input-attrs="{name: 'q', class: 'so-landing--search--input', type: 'text'}"  :items="items" :get-label="getLabel" :type="submit" :component-item='template' @update-items="updateItems" @item-clicked="itemClicked" @item-selected="itemSelected">
   </v-autocomplete>
 </template>

<script>
import ItemTemplate from "./TplItem.vue";
import Animals from "./animals.js";
export default {
  data() {
    return {
      item: {},
      items: [],
      template: ItemTemplate
    };
  },
  methods: {
    itemSelected(item) {
      console.log("Selected item!", item);
    },
    itemClicked(item) {
      console.log("You clicked an item!", item);
    },
    getLabel(item) {
      if (item) {
        return item.name;
      }
      return "";
    },
    updateItems(text) {
      this.items = Animals.filter(item => {
        return new RegExp(text.toLowerCase()).test(item.name.toLowerCase());
      });
    }
  }
};
</script>
