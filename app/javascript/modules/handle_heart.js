import $ from 'jquery'
import axios from 'modules/axios'


const listenInactiveHeratEvent = (articleId) => {

  $('.inactive-heart').on('click', () => {
     axios.post(`/articles/${articleId}/like`)
     .then((response) => {
       if (response.data.status === 'ok') {
         $('.active-heart').removeClass('hidden')
         $('.inactive-heart').addClass('hidden')
       }
     })
     .catch((e) => {
       window.alert('Error')
       console.log(e)
      })
   })
}

const listenActiveHeratEvent = (articleId) => {
  $('.active-heart').on('click', () => {
      axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
          if (response.data.status === 'ok') {
              $('.active-heart').addClass('hidden')
              $('.inactive-heart').removeClass('hidden')
          }
       })
       .catch((e) => {
          window.alert('Error')
          console.log(e)
       })
    })   
}

export {
  listenInactiveHeratEvent,
  listenActiveHeratEvent
}
